# Onnokh's Homebrew tap

macOS apps by Onno Klein Hofmeijer.

```sh
brew tap onnokh/tap
brew trust onnokh/tap
brew install --cask tabski tunnelski tileski rankstas-paradise
```

Homebrew loads a third-party tap only after `brew trust`.

| Cask | App |
|---|---|
| `tabski` | [Tabski](https://tabski.onkie.dev/), a fast window switcher. Apple silicon, macOS 26 or later. |
| `tunnelski` | [Tunnelski](https://tunnelski.onkie.dev/), a menu bar OpenVPN client with TOTP two-factor codes. |
| `tileski` | [Tileski](https://tileski.onkie.dev/), a window tiler with keyboard shortcuts. Apple silicon, macOS 26 or later. |
| `rankstas-paradise` | [Ranksta's Paradise](https://github.com/Onnokh/rankstas-paradise), the Mac client of the SEO service. |

Tabski, Tunnelski and Tileski update themselves (Sparkle). `brew upgrade` updates Ranksta's Paradise.

All apps are signed with Developer ID and notarized.
