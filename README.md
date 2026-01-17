# Dotfiles Management with GNU Stow

This guide explains how to manage your dotfiles repository using **GNU Stow**.  
It covers stowing individual configs, applying all configs at once, and removing them cleanly.

---

## ⚡ 1. Stowing a Single Config

You can apply each package individually. For example:

### Alacritty
```bash
cd ~/dotfiles
stow alacritty
````

### i3

```bash
stow i3
```

### Local Scripts

```bash
stow local
```

> Tip: Your `.stowrc` defines the correct target paths, so you don’t need to specify them manually.

---

## 🌐 2. Applying All Configs

To apply **all dotfiles at once**:

```bash
cd ~/dotfiles
stow *
```

This reads your `.stowrc` and creates all necessary symlinks for all packages in your home directory.

---

## ❌ 3. Unstowing a Package

To **remove a configuration safely**:

```bash
cd ~/dotfiles
stow -D alacritty
```

* `-D` removes all symlinks created by this package.
* Original files in your repo remain untouched.
* Example for other packages:

```bash
stow -D local
stow -D i3
```

> Make sure you unstow only the intended package.

---

## 🎯 Tips for Smooth Stow Usage

* Always **cd into your repo root** before running Stow.
* Use `ls -l` to verify symlinks.
* Keep `.stowrc` updated whenever you add new packages.
* Use `stow -v <package>` for verbose output to see what links are created.

---

With this setup, your dotfiles are **modular, version-controlled, and easily deployable**.
