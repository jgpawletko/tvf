# TVF
[![Build Status](https://travis-ci.org/jgpawletko/tvf.svg?branch=master)](https://travis-ci.org/jgpawletko/tvf)

## Overview
This gem is being developed to explore refactoring options for
[NYULibraries/Ichabod](https://github.com/NYULibraries/ichabod) project.

## Status
#### In Development
This code is a proof-of-concept and the interface needs to be validated  
against actual needs, e.g., are the different selector methods described  
below (and implmeneted in this gem) useful?  


## Classes
`Terms`, `Vocabulary`, `Field`


## Available Selectors
```
Terms#all             # => all fields from all vocabularies (array of symbols)  
Terms#multiple        # => all fields from all vocabularies where multiple == true  
Terms#single          # => all fields from all vocabularies where single   == true  
Terms#facetable       # ...  
Terms#mandatory

Vocabulary#all        # => all fields from this vocabulary (array of symbols)
Vocabulary#multiple   # => all fields from this vocabulary where multiple == true
Vocabulary#single     # => all fields from this vocabulary where single   == true
Vocabulary#facetable  # ...
Vocabulary#mandatory
```

## Dynamically generated methods:
Dynamic programming is used to create singleton methods.  
The keys of the hashes passed to the constructors are used for the method names.

For instance,
```
my_cool_hash = {
                foo: {...},
                bar: {...},
                baz: {...}
				}

my_terms = TVP::Terms.new(my_cool_hash)
```

After instantiation, the `my_terms` object will respond to  
```
my_terms.foo
my_terms.bar  
my_terms.baz  
```

This technique is used in other classes as well.


## Examples:

```

require 'tvf'

# YAML file contains a set of "vocabulary" keys
# e.g., :dcterms, :ichabod, :nyucore
data = Utils.symbolize_keys(YAML.load_file('metadata_fields.yml'))[:terms][:vocabulary]

# instantiate Terms object
my_terms = TVF::Terms.new(data)

my_terms.vocabularies
=> [:dcterms, :ichabod, :nyucore]

my_terms.dcterms.facetable
=> [:contributor, :creator, :format, :language, :subject]

my_terms.nyucore.uri
=> "http://harper.bobst.nyu.edu/data/nyucore#"

my_terms.all
=> [:title, :identifier, :contributor, :creator, :date, :description,
   :format, :language, :publisher, :relation, :rights, :subject,
   :type, :addinfolink, :addinfotext, :data_provider, :discoverable,
   :geometry, :isbn, :location, :repo, :resource_set, :subject_spatial,
   :subject_temporal, :available, :citation, :edition, :restrictions, :series,
   :version]

my_terms.ichabod.multiple
=> [:addinfolink, :addinfotext, :data_provider, :discoverable, :geometry,
    :isbn, :location, :subject_spatial, :subject_temporal]

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tvf.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
