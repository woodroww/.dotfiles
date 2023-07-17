
## backup
GOOGLE_DRIVE_SETTINGS=~/.duplicity/credentials \
    ~/.pyenv/versions/lovely/bin/python /usr/bin/duplicity \
    --use-agent \
    --encrypt-key 242834DF88EF9255 \
    --sign-key C9030FCA6CA03D4F \
    --exclude-filelist ~/.duplicity/excludes \
    ~/obsidian gdocs://example528@gmail.com/obsidian

## restore
GOOGLE_DRIVE_SETTINGS=~/.duplicity/credentials \
    ~/.pyenv/versions/lovely/bin/python /usr/bin/duplicity restore \
    --use-agent gdocs://example528@gmail.com/obsidian \
    ~/restore_obsidian
