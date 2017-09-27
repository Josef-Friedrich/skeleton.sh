---

# README-header.md

## Get `skeleton.sh`

```sh
mkdir -p test/lib
wget -O test/lib/skeleton.sh https://raw.githubusercontent.com/JosefFriedrich-shell/skeleton.sh/master/skeleton.sh
chmod a+x test/lib/skeleton.sh
./test/lib/skeleton.sh --sync-skeleton
```

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
