" pytestのjunit.xmlを読み込み
function OpenQF(efm, lines)
  let old_errorfomat = &errorformat
  try
    set errorformat<
    let &errorformat = a:efm
    cex a:lines
    copen
  catch
    echo v:exception
  finally
    let &errorformat = old_errorfomat
  endtry
endfunction


" バッファ一覧をQuickFixウィンドウで開く
function! ListBuffers()
    let efm = ""
    " ignore empty lines
    let efm .= "%-G %#"
    " ignore non-saved buffers such as [No Name]
    let efm .= ",%-G%.%# \"[%.%#]\"%.%#"
    let efm .= ",%m %#\"%f\" %#line %l"

    call OpenQF(efm, execute("ls"))
endfunction


" pytestのjunit.xmlを読み込み
function QFPytestInitialize()
    py3 << EOF
import sys
from itertools import dropwhile
from xml.etree import ElementTree


def QFPytest_collect_failures(tree: ElementTree):
    """
    collect failure information from parsed junit.xml

    :param tree:
        collect failure in this tree
    """
    root = tree.getroot()
    assert root.tag.lower() == 'testsuite'
    for c_idx, case in enumerate(root.iter('testcase')):
        failure = case.find('./failure')
        error = case.find('./error')
        file = case.attrib.get('file', '')
        line = int(case.attrib.get('line', '0')) + 1

        messages = []
        if failure is not None:
            messages += [
                l
                for l in failure.text.split('\n')
                if l.startswith('E ')
            ] or ['E' + 'UNK']

        if error is not None:
            messages += [
                l
                for l in failure.text.split('\n')
                if l.startswith('E ')
            ] or ['E' + 'UNK']

        for e_idx, msg in enumerate(messages):
            msg = 'E{c_idx:d}-{e_idx:d}: {msg}'.format(
                c_idx=c_idx,
                e_idx=e_idx,
                msg=msg.lstrip('E ').lstrip(' '),
            )
            yield '{file}, {line}, {message}\n'.format(
                file=file,
                line=line,
                message=msg,
            )


def QFPytest_print_failures(path: str) -> None:
    """
    Read junit.xml from `path`,
    then parse it,
    finally, print failures

    :param path:
        path where junit.xml is stored
    """
    tree = ElementTree.parse(path)
    failures = QFPytest_collect_failures(tree)
    sys.stdout.writelines(failures)
EOF
endfunction


" pytestのjunit.xmlを読み込み
function QFPytestFailures(path)
    let efm = "%-G %#\,%f\\, %l\\, %m"
    try
        let lines =  execute(
\           "py3 QFPytest_print_failures('" . a:path . "')"
\       )
        if lines != ""
            call OpenQF(efm, lines)
        endif
    catch
        echo v:exception
    endtry
endfunction


" initialize
call QFPytestInitialize()

" export
command! ListBuffers :call ListBuffers()
command! -complete=file -nargs=1 QFPytestFailures :call QFPytestFailures(<f-args>)
