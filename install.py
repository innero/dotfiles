#! /bin/python3
import os
ignored = ['examples', '.git']

post_stow_scripts = ['make-profile-link']

def check_stow():
    return os.system('stow --version')

def get_dotfile_dirs(workdir=os.getcwd()):
    listable = [x for x in os.listdir() if x not in ignored]
    dirs = [d for d in listable if os.path.isdir(d)]
    return dirs

def get_conflicts(workdir=os.getcwd()):
    home_dir = os.environ.get('HOME')
    dotfile_dirs = get_dotfile_dirs(workdir)
    all_contents = []
    os.chdir(workdir)
    for d in dotfile_dirs:
        all_contents += os.listdir(d)
    all_contents = set(all_contents)
    home_dir_files = set(os.listdir(home_dir))
    conflict_set = all_contents & home_dir_files
    return conflict_set if conflict_set else None

def do_stow(mode=0):
    exec_stow = {
        0: lambda: exit(),
        1: force_stow,
        2: selective_stow,
        3: direct_stow,
    }
    exec_stow[mode]()

def direct_stow():
    dotfile_dirs = get_dotfile_dirs()
    to_stow = ' '.join(dotfile_dirs)
    print('Stowing ' + to_stow + ' ...')
    os.system('stow ' + to_stow)
        
def force_stow():
    conflicts = get_conflicts()
    to_rm = ' '.join(conflicts)
    old_workdir = os.getcwd()
    os.chdir(os.environ.get('HOME'))
    os.system('rm -f ' + to_rm)
    os.chdir(old_workdir)
    direct_stow()

def selective_stow():
    conflicts = get_conflicts()
    dotfile_dirs = get_dotfile_dirs()
    for dotfile_dir in list(dotfile_dirs):
        if set(os.listdir(dotfile_dir)) & conflicts:
            dotfile_dirs.remove(dotfile_dir)
    to_stow = ' '.join(dotfile_dirs)
    if to_stow.strip():
        print('Stowing ' + to_stow + ' ...')
        os.system('stow ' + to_stow)
    else:
        print('Nothing to do. Bye-bye!')

    
if check_stow() != 0:
    print("GNU stow not installed! Aborting...")
    exit()
    
conflicts = get_conflicts()

if conflicts:
    print(conflicts)
    print('These files you have in your home directory conflict with the dotfiles.')
    print('0.quit', '1.Override all files', '2.Create links but don\'t override any file', sep='\n')
    proceed = input('>>>> ')
    do_stow(mode=int(proceed))
else:
    print('No conflicts! Directly stowing...')
    do_stow(mode=3)

print('----Running post-stow scripts----')
for f in post_stow_scripts:
    print('Running ' + f)
    os.system('bash ' + f)
