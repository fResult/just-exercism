# Haskell Exercises

[Exercism Haskell track](https://exercism.org/tracks/haskell) — practicing functional programming with Haskell.

## Prerequisites

- [Exercism CLI](https://exercism.org/docs/using/solving-exercises/working-locally)
- [Stack](https://docs.haskellstack.org/) (Haskell build tool)
- GHC 9.6.7 (managed by Stack via `resolver: lts-22.44`)

## How to Run Tests

```sh
cd path/to/just-exercism/haskell

# Run a specific exercise
stack test <folder_name>

# Run all exercises
stack test
```

**Example:**

```console
➜ stack test 005_space-age

space-age> test (suite: test)

ageOn
  Earth [✔]
  Mercury [✔]
  Venus [✔]
  Mars [✔]
  Jupiter [✔]
  Saturn [✔]
  Uranus [✔]
  Neptune [✔]

Finished in 0.0012 seconds
8 examples, 0 failures

space-age> Test suite test passed
```

## Project Structure

```
haskell/
├── stack.yaml          # Multi-package project config
├── hie.yaml            # HLS (IDE) config for all exercises
├── 001_hello-world/
│   ├── package.yaml    # Exercise dependencies
│   ├── src/            # Solution code goes here
│   └── test/           # Test suite (DO NOT modify)
├── 002_leap/
│   └── ...
└── ...
```

## Adding a New Exercise

1. Download the exercise from Exercism and place it in `NNN_exercise-name/`
2. Add the folder to `stack.yaml` under `packages:`
3. Add path mappings to `hie.yaml` for IDE support
4. If you need extra packages (e.g. `containers`, `text`), add them to `package.yaml` under `library > dependencies`

## References

Standard library docs for solving exercises:

- [GHC.List](https://hackage-content.haskell.org/package/base-4.22.0.0/docs/GHC-List.html) — List operations (`map`, `filter`, `foldl`, `foldr`, `zip`, etc.)
- [Data.Char](https://hackage-content.haskell.org/package/base-4.22.0.0/docs/Data-Char.html) — Character utilities (`toLower`, `isAlpha`, etc.)
- [Data.List](https://hackage-content.haskell.org/package/base-4.22.0.0/docs/Data-List.html) — Extended list functions (`nub`, `sort`, `group`, etc.)
- [Data.Set](https://hackage-content.haskell.org/package/containers-0.7/docs/Data-Set.html) — Set operations (requires `containers` package)
- [Prelude](https://hackage-content.haskell.org/package/base-4.22.0.0/docs/Prelude.html) — Functions available by default
