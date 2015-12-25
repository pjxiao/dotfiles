import os
import sys

from mercurial import commands, hg, ui
from mercurial.cmdutil import findrepo


repo_path = findrepo(os.getcwdu())

if repo_path:
    u = ui.ui()
    repo = hg.repository(u, repo_path)
    sys.stdout.write(repo.dirstate.branch())
