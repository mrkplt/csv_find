CSV Find v1.0.0
========

<!-- [![Code Climate](https://codeclimate.com/github/mrkplt/csv_class_maker.png)](https://codeclimate.com/github/mrkplt/csv_class_maker) -->

Let's just get this out of the way: this gem is 60% an academic exercise in
quickly navigating through a CSV without actually using the Ruby CSV library
for much of it. How do we do that? We shell out to the system and use some tools
to chomp the file down to the pieces we are looking for. It's actually pretty
fast at finding arbitrary records in even very large CSV files without being
crazy memory intensive. That's probably why I started writing this in the first
place.

I have used this code in production, you can too, most of the time you probably
want a solution backed by the CSV library. I don't think I have done any
benchmarking against it. You can see how to do some of this in a more normal way
over here:

https://stackoverflow.com/questions/9599568/how-to-find-a-specific-row-in-csv/33849136

Usage
--------------

Install
```
gem install csv_find
```
Add it to a class.
```
class People
  include CsvFind
  csv_file('path/to/people.csv', {optional: 'csv_configurations'})
end

```

Now you have a setters and getters based on the headers of the csv file.

Methods
```
Yourclass.new
Yourclass.find(line_number)
Yourclass.where(header1: 'value', header2: 'value')
Yourclass.first
Yourclass.last
Yourclass.each { |a| a.method  }
```

Plus, the Enumerable module is implemented!

License
-------
CSV Find is Copyright © 2020 Mark Platt, Inc. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
