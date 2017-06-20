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
  // Convert into an object of tag/count pairs including untagged
  .reduce((acc, val) => {
    // Find the name of the tag if it exists otherwise mark it as 'untagged'
    const tag = val.match(/^[a-zA-Z1-9\-]+:\ .+/) ? val.split(':')[0].trim().toLowerCase() : 'untagged';
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
  .forEach((key) => {
    const percent = ((countByTypes[key] / commitCount) * 100).toFixed(2);
    console.log(`  ${key}: ${countByTypes[key]} (${percent}%)`)
  });
