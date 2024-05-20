# **Designing Learning Tools : Team M project**
A teaching story based game about science and engineering ethics.<br>
[Web game on itch.io](https://nervzz.itch.io/perils-of-innovation)

## **Authors**
Dominik Helbing [@Neroxsis](https://github.com/Neroxsis)<br>
Jehan Joachim Daniel Piaget [@Fantaisient](https://github.com/Fantaisient)<br>
Julien Jordan [@NervzZ](https://github.com/NervzZ)<br>
Quang Long Ho Ngo [@Lipefree](https://github.com/Lipefree)<br>
Simon Josef Thür [@simi48](https://github.com/simi48)

## **Useful links**
- [Course Moodle](https://moodle.epfl.ch/course/view.php?id=16140)
- [Story diagram](https://drive.google.com/file/d/1XlJjgT6YnePGoKmm4qgJqwQ_8e5j0I9H/view?usp=sharing)
- [Free Assets](https://github.com/NervzZ/Designing-learning-tools-project/issues/19#issuecomment-1997291883)
- [Researched assets](https://github.com/users/NervzZ/projects/2/views/1?query=is%3Aopen+sort%3Aupdated-desc&pane=issue&itemId=58549438)

### **Reports:**
1. [Due 22 march](https://docs.google.com/document/d/1-bfWZRgjrGjKa4F6o32UVZtAafp4Tc3kx4yyHcvj0Vw/edit)

## **How to work with Git:**
1. Create a branch from one of the board's issues (or manually if needed).
2. You can then use `git fetch` to make the new branch visible locally.
3. Checkout to that branch using `git checkout`. To see on which branch you currently are and list available branches, use `git branch`.
4. As you make each change iterations on this branch, proceed as follows:
    * Use `git status` everytime to see what has been changed and is currently added to commit (green) or not (red).
    * Use `git add` followed by the path to the file you want to add to commit. **Note:** You can use wildcards, for example to add all files you can do `git add *`.
    * Once you're done adding what you wanted for your next commit, use `git commit -m {message}` where `{message}` is simply a short description of what has changed with this commit.
    * To push your commits to the branch (both locally and remote) you can now do `git push`.
5. Once you pushed all your changes and you're done with the branch, head over to the repo and make the pull request to merge your changes to `main`. Also consider deleting the branch (also locally) before it gets annoying to nagivate when using `git branch`.

NOTE: Use `git restore {path to file}` to roll-back the changes you made to a file and restore it back to the latest unchanged state known to your branch.<br><br>
   
**Important:**<br>
If the remote branch is more up to date than your local one, you simply do `git pull` to update your local branch. Always do so when needed.<br><br>
If `main` got updated while you were working on a branch not yet finished and for some reason you need the new changes of main, you can use `git rebase main` from your current branch and then `git push --force`.<br>
Be very cautious with doing this and consider asking before attempting it if unsure.
