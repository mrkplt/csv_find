CSV Find v0.0.1
========

<!-- [![Code Climate](https://codeclimate.com/github/mrkplt/csv_class_maker.png)](https://codeclimate.com/github/mrkplt/csv_class_maker) -->

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
CSV Find is Copyright © 2015 Mark Platt, Inc. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
