#!/usr/bin/env node
const child_process = require('child_process');

// Get some data from git
const commitCount = child_process
  .execSync('git rev-list --all --count')
  .toString()
  .trim();

const commitMessages = child_process
  .execSync('git log --format=%s')
  .toString()
  .trim();

// Process commit messages
const countByTypes = commitMessages
  .split('\n')
  // Filter out messages without a proper tag
  .filter(message => message.match(/^[a-zA-Z1-9]+:\ .+/))
  // Convert into an object of tag/count pairs
  .reduce((acc, val) => {
    const [rawTag, ...message] = val.split(':');
    const tag = rawTag.trim().toLowerCase();
    if (acc[tag]) {
      acc[tag]++;
    } else {
      acc[tag] = 1;
    }
    return acc;
  }, {});

// Print the stats
console.log('dotfile stats');
console.log('=============\n');

console.log(`Total commits: ${commitCount}`);
console.log('Commits by tag:');
Object.keys(countByTypes)
      .sort((a, b) => countByTypes[b] - countByTypes[a])
      .forEach((key) =>
        console.log(`  ${key}: ${countByTypes[key]}`));
