verPerl=perl-5.40.3@esi-reader
tspDate:=$(shell git show --no-patch --format=%ct)

build: clean
	perlbrew exec --with $(verPerl) bash -c '. $$HOME/.bashrc \
	&& pp \
		--module DBI \
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
	cpanm DBI
	cpanm Getopt::Long
	cpanm Tk
	cpanm Tk::ProgressBar
	cpanm Tk::Optionmenu
	cpanm Tk::BrowseEntry
	cpanm Tk::Labelframe
	cpanm Tk::Pane
	cpanm Tk::HList
	cpanm Tk::ItemStyle
	cpanm JSON
	cpanm LWP::Protocol::https
	cpanm MIME::Base64
	cpanm Time::HiRes
	cpanm IPC::Shareable
	cpanm REST::Client
