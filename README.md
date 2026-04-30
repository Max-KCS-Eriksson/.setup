# Linux Post-Install Setup Scripts

Modular Bash scripts for setting up a working development environment after a fresh Linux installation.

The project is currently implemented for Void Linux, but the structure is intended to allow distribution-specific setup logic to be extended over time.

---

## Purpose

After a fresh OS installation, the same setup steps often need to be repeated manually:

- installing packages
- enabling services
- configuring development tools
- installing tools outside the package manager
- restoring a usable desktop/development environment

This project automates that process through a reproducible and modular setup flow.

The initial use case is a minimal Void Linux installation where only a TTY and network connection are available.

---

## Project Structure

The setup flow is split into separate responsibilities to keep the scripts modular and easier to extend. Distribution-specific files are kept separate from the generic setup logic.

```bash
.
├── main.sh                     # Entry point
├── resources/
│   └── distro/
│       └── void/               # Void-specific package lists and notes
└── src/
    ├── install_os_packages.sh  # OS package installation
    ├── setup_services.sh       # Service setup entry point
    ├── extras/
    │   ├── setup/              # Extra setup for package-managed tools
    │   └── tools/              # Tools installed outside the package manager
    ├── helpers/                # Shared helper scripts
    └── services/
        └── runit/              # Runit service configuration
```

---

## Usage

Run the main script from the project root:

```bash
./main.sh
```

The script coordinates package installation, service setup, and optional tool configuration.

---

## Adding Setup Scripts

Additional setup scripts can be added in two places, depending on how the tool is installed.

### Package-managed tools

Place scripts in:

```text
src/extras/setup/
```

Use this directory for tools that are installed through the system package manager but require additional setup or configuration.

Example:

```text
src/extras/setup/mise.sh
```

### Tools outside the package manager

Place scripts in:

```text
src/extras/tools/
```

Use this directory for tools that are installed or configured outside the system package manager.

Example:

```text
src/extras/tools/navi.sh
```

During execution, scripts in these directories are discovered and run automatically.

---

## Distribution Support

Current implementation:

- Void Linux

Void-specific package lists and notes are located in:

```text
resources/distro/void/
```

See the [Void-specific README](resources/distro/void/README.md) for package list maintenance and package installation notes.

---

## Notes

The project is built around my own Linux setup workflow and is primarily intended as a reproducible personal development environment setup.

It is public as a reference implementation of a modular post-install setup flow, rather than as a universal Linux installer.

---

## Future Improvements

- Add support for additional distributions
- Add safer dry-run or confirmation modes
- Improve logging and error handling
- Add more explicit dependency checks before execution
