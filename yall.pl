##
# In my everyday language I use the term 'guys' to address groups of
# people. Some people find this offensive, because they don't see it
# as a gender-neutral term.
# This script will intercept all outgoing messages, and replace 'guys'
# with something more gender-neutral.
#
# Usage
# -----
# Copy this script to: ~/.irssi/scripts
# Use the command:     /run yall
#
#
# Options
# -------
# /set yall_silly <ON|OFF>
# * This will replace any occurance of the term 'guys' with a silly
#   gender-neutral alternative. eg:
#   yall_silly OFF -- guys -> y'all | everyone | everybody | people | folks
#   yall_silly ON  -- guys -> you uns | youse | dweebs | nerds
##

use strict;
use warnings;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = '1.0';
%IRSSI = (
    authors     => 'Paul McMonagle',
    contact     => 'mcmonagle.paul@gmail.com',
    name        => 'yall',
    description => 'Intercept outgoing messages and replace instances of "guys" with a gender-neutral alternative.',
    license     => 'MIT',
    url         => 'https://github.com/pmcmonagle/irssi-yall',
    changed     => '12:00:00, Sep 28th, 2015 UYT',
);

Irssi::settings_add_bool('yall', 'yall_silly', 0);

sub event_outgoing_msg {
    my ($message, $server, $witem) = @_;
    my $use_silly = Irssi::settings_get_bool('yall_silly');

    # TODO consider removing qw
    # and using regular strings
    my @reg_strings = qw(
        y'all
        everyone
        everybody
        people
        folks
    );

    my @sil_strings = qw(
        youns
        youse
        dweebs
        nerds
    );

    my @strings = $use_silly ? @sil_strings : @reg_strings;
    my $replace = $strings[rand @strings];

    $message =~ s/guys/$replace/gi;
    Irssi::signal_continue($message, $server, $witem);
}

Irssi::signal_add("send text", \&event_outgoing_msg);
