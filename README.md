# prompt-context
Scripts for piping information to my clipboard for writing prompts. (They rely on Mac OS's `pbcopy`.)

Read more in my blog post, [Ad hoc tools for gathering prompt context](https://austinhenley.com/blog/promptcontext.html).

## git-clipper

Run the script from a git repo to copy the contents of all modified files to your clipboard: `git-clipper`

If needed, add to your bin folder and make it executable: `sudo cp git-clipper.zsh /usr/local/bin/git-clipper` and `sudo chmod +x /usr/local/bin/git-clipper`.

## web-clipper

Run the script with a URL as an argument to fetch the content of that page and save it to your clipboard: `python3 web-clipper https://austinhenley.com/blog/promptcontext.html`

Install the dependencies: `pip3 install newspaper3k` and `pip3 install pyperclip`.

## all-code-clipper

Run the script to recursively find all code files in a directory, concatenate their contents, and save the result to your clipboard: `./all-code-clipper`
