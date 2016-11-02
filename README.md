winrb
=======================

## Things to Do
```
Allow rbenv to read .ruby-version file
Add Alias functionality to simplify using rbenv local
```

## Install
```bash
git clone https://github.com/blh0021/winrb.git %USERPROFILE%\.winrb
```

## Dependencies
* Install 7Zip
* Add to Path Environment Variable
```
%USERPROFILE%\.winrb
C:\Program Files\7-Zip
```

## Download a version of Ruby
```bash
rbenv install 2.1.5
```

## To show install versions of Ruby
```bash
rbenv versions
```

## To use a version of Ruby
```bash
rbenv local 2.1.5
```

## Troubleshooting

1. Getting error when installing a Gem.  
```bash
rbenv fixcert
```

2. Gemfile is not able to install because of native extensions.
```bash
rbenv devkit
```
