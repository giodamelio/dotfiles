#!/usr/bin/env python
from subprocess import check_output
from collections import defaultdict
from re import match

# Get some data from git
commit_count = check_output(['git', 'rev-list', '--all', '--count']).decode('utf8') # Commit count
commit_messages = check_output(['git', 'log', '--format=%s']).decode('utf8') # Commit messages

# Get the tag from a commit message
def get_tag(message):
    if match(r'^[a-zA-Z1-9\-]+:\ .+', message):
        return message.split(':')[0].lower()
    else:
        return 'untagged'

# Group the messages by the tag
commit_by_tag = {message: get_tag(message) for message in commit_messages.split('\n')}
commit_tag_by_commits = defaultdict(list)

for message, tag in commit_by_tag.items():
    commit_tag_by_commits[tag].append(message)

print('doffile stats')
print('=============')

print('Total commits: {}'.format(commit_count))

print('Commits by tag')
sorted_tags = sorted(commit_tag_by_commits, key=lambda tag: len(commit_tag_by_commits[tag]), reverse=True)
for tag in sorted_tags:
    count = len(commit_tag_by_commits[tag])
    percent = (count / float(commit_count)) * 100
    print('  {}: {} ({:.2f}%)'.format(tag, count, percent))
