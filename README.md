# svg2gif.sh

> 🖼️ Convert any SVG animation into a GIF with one command.  
> Powered by Node.js, Puppeteer, and ffmpeg — wrapped in a friendly Bash script.

---

## ✨ Features
- Interactive: prompts for input/output file paths
- Hides npm / ffmpeg noise, shows a neat spinner
- Cross-platform (Linux, macOS, WSL)
- Automatic dependency check (Node, npm, ffmpeg)
- First run auto-installs Puppeteer locally

---

## 🚀 Usage

```bash
# make it executable
chmod +x svg2gif.sh

# run it
./svg2gif.sh
````

You’ll be prompted:

```
Path to input SVG: ./animation.svg
Path to output GIF: ./animation.gif
```

When it’s done, you’ll see:

```
[✔] Done! GIF saved to: ./animation.gif
```

---

## ⚙️ Environment Knobs

Customize capture by exporting these before running:

* `DUR` – duration in seconds (default: 4)
* `FPS` – frames per second (default: 15)
* `W` / `H` – viewport width/height in px (default: 1600×600)
* `OUTW` – output width in px (default: 600)

Example:

```bash
DUR=6 FPS=24 OUTW=800 ./svg2gif.sh
```

---

## 📦 Requirements

* [Node.js](https://nodejs.org/) (≥14)
* [npm](https://www.npmjs.com/)
* [ffmpeg](https://ffmpeg.org/)

The script will install [Puppeteer](https://pptr.dev/) locally on first run.

---

## 📝 License

MIT — free to use, modify, and share.
