verPerl=perl-5.40.3
strPerl=$(verPerl)@esi-reader
tspDate:=$(shell git show --no-patch --format=%ct)

build: clean
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc \
	&& pp \
		--module DBI \
		--module DBD::SQLite \
		--module File::Basename \
		--module File::Path \
		--module File::Copy \
		--module Cwd \
		--module Getopt::Long \
		--module Tk \
		--module Tk::ProgressBar \
		--module Tk::Optionmenu \
		--module Tk::BrowseEntry \
		--module Tk::Labelframe \
		--module Tk::Pane \
		--module Tk::HList \
		--module Tk::ItemStyle \
		--module List::Util \
		--module JSON \
		--module MIME::Base64 \
		--module Time::HiRes \
		--module POSIX \
		--module IPC::Shareable \
		--module REST::Client \
		--module Env \
		--module utf8 \
		--module LWP::Protocol::https \
		--compile \
		--compress=0 \
		--tempcache $(tspDate) \
		-o esi-reader.$$(uname --kernel-name) \
		esi-reader.pl'

clean:
	rm --force --verbose esi-reader.$$(uname -s)

deps:
	@which perlbrew >/dev/null
	perlbrew list | grep --fixed-strings --quiet '$(verPerl)' \
	|| perlbrew install --verbose $(verPerl)
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm DBI'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm DBD::SQLite'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Getopt::Long'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk::ProgressBar'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk::Optionmenu'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk::BrowseEntry'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk::Labelframe'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk::Pane'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk::HList'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Tk::ItemStyle'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm JSON'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm LWP::Protocol::https'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm MIME::Base64'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm Time::HiRes'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm IPC::Shareable'
	perlbrew exec --with $(strPerl) bash -c '. $$HOME/.bashrc ; cpanm REST::Client'
