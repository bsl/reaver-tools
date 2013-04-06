reaver-tools is a Ruby gem with tools to make using [Reaver][1] easier. This
stuff is not robust at all. It's just barely enough to do what I need.

Installation
------------
```shell
gem build reaver-tools.gemspec && gem install reaver-tools-*.gem
cp reaver-tools.conf.example ~/.reaver-tools.conf
```

Usage
-----
```shell
sudo -E reaver-list aps && sudo -E reaver-process aps
```

reaver-process will run reaver-run for every entry in the aps file. If the
attack is working, let it run. If not, hit ^C and reaver-process will go on to
the next entry.

reaver-run creates reaver session files in $cache_dir, and resumes
automatically.

If an AP is resistant to the attack and you don't want to waste any more time
with it, create a file named, e.g., _001122334455.wpc (note the underscore) in
$cache_dir. This will cause reaver-process to skip that AP on the next run.

[1]: https://code.google.com/p/reaver-wps/
