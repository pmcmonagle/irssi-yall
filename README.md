# irssi-yall
A quick Perl script for the Irssi IRC client that helps enforce the use of gender-neutral language.

## About
In my everyday language I use the term "guys" to address groups of more than one person. This is a regional colloquialism. Some people find this offensive, because they don't perceive "guys" as a gender-neutral term. They would prefer that I address groups as "y'all", or "folks", or "everyone".

This script will intercept all outgoing messages, and replace "guys" with something more gender-neutral. Is this a good idea? I don't know; maybe it's unnecessary, or maybe it's missing the point entirely. I wrote it because I'm better at writing code than I am at philosophising about gender issues.

## Usage
1. Copy yall.pl to `~/.irssi/scripts`.
2. Within irssi, use `/run yall` to start the script.
3. (optional) Create a symlink to yall.pl in `~/.irssi/scripts/autorun` to autostart the script.

## Options
Use `/set yall_silly <ON|OFF>` to toggle silly-mode (off by default). Use at your own discretion; referring to a group of IRC users as 'dweebs' might get you into even more trouble!
