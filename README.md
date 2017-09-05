[![Build Status](https://travis-ci.org/JosefFriedrich-shell/skeleton.sh.svg?branch=master)](https://travis-ci.org/JosefFriedrich-shell/skeleton.sh)

# skeleton.sh

---

# README-header.md

## Folder structure

```
skeleton.sh
├── LICENSE
├── Makefile
├── README-footer.md
├── README-header.md
├── skeleton.sh
└── test
    ├── lib
    │   ├── bash_unit
    │   ├── bats
    │   │   ├── bats
    │   │   ├── bats-exec-suite
    │   │   ├── bats-exec-test
    │   │   ├── bats-format-tap-stream
    │   │   └── bats-preprocess
    │   ├── skeleton.sh
    │   └── test-helper.sh
    ├── skeleton.bats
    └── skeleton.bash_unit
```

---

## Summary / Short description

> This is the management script of the skeleton.sh project!

## Usage

```
skeleton.sh v1.0

Usage: skeleton.sh [-AdhrSstv]

This is the management script of the skeleton.sh project!

Options:
	-A, --sync-all
	  Sync all projects that have the same parent folder as this
	  project.
	-d, --sync-dependencies
	  Sync external dependenices (e. g. test-helper.sh bats)
	-h, --help
	  Show this help message
	-r, --render-readme
	  Render “README.md”.
	-S, -sync-skeleton
	  Sync your project with the skeleton project and update some
	  boilerplate files (e. g. Makefile test/lib/skeleton.sh)
	-s, --short-description
	  Show a short description / summary
	-t, --test
	  Run the tests located in the “test” folder.
	-v, --version
	  Show the version number of this script.

```

## Testing

```
make test
```

---

# README-footer.md

```
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
```

---
