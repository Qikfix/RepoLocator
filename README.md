# RepoLocator

In order to excute run the following prior:
```
# hammer --csv repository list > repolist.txt
# hammer --csv content-view list > cv_list.txt
```

Now you can execute:

```
# wget https://raw.githubusercontent.com/risantam89/RepoLocator/main/repolocator.sh
# ./repolocator.sh
```

The output should be similar to below:

```
# ./repo_cv.sh 
- Repo ID ....: 87
- Repo Name ..: CentOS
12,cv_tools

- Repo ID ....: 82
- Repo Name ..: EPEL
12,cv_tools

- Repo ID ....: 6
- Repo Name ..: Red Hat Enterprise Linux 8 for x86_64 - AppStream RPMs 8
8,cv_test
9,critical

- Repo ID ....: 48
- Repo Name ..: Red Hat Enterprise Linux 8 for x86_64 - AppStream Kickstart 8.6

```

As you can see above `Repo ID 87` for repository CentOS is located in the `content view cv_tools` ID 12.
