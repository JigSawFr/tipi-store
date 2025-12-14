# RenderCV

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/rendercv/rendercv) [<img src="https://img.shields.io/github/issues/rendercv/rendercv?color=7842f5">](https://github.com/rendercv/rendercv/issues)

A Typst-based CV/resume generator for academics and engineers.

---

## 📖 SYNOPSIS

RenderCV is a powerful CV/resume generator that allows you to version-control your CV as source code. Write your CV in YAML with Markdown syntax, and RenderCV generates a professional PDF with perfect typography using the Typst engine. It's designed to help you focus on content rather than formatting.

---

## ✨ MAIN FEATURES

- **📝 Version Control** - Manage your CV as plain text YAML files
- **🎨 Multiple Themes** - Built-in themes: Classic, Engineeringresumes, Sb2nov, Moderncv, Engineeringclassic
- **⚙️ Full Customization** - Complete control over every design detail
- **✅ Strict Validation** - Clear error messages with YAML validation
- **🌍 Multi-Language Support** - Supports Chinese, Japanese, Korean, and other languages
- **📊 Typst Engine** - Fast and powerful PDF generation (migrated from LaTeX)
- **🔧 CLI Tool** - Command-line interface for automation and integration
- **📦 Markdown Syntax** - Write content using familiar Markdown formatting

---

## 🚀 USAGE

This is a CLI application without a web interface. To use RenderCV:

1. Access the container shell:
   ```bash
   docker exec -it rendercv sh
   ```

2. Create your CV YAML file in `/rendercv/`:
   ```bash
   cd /rendercv
   rendercv new "John Doe"
   ```

3. Edit the generated `John_Doe_CV.yaml` file with your information

4. Generate your PDF:
   ```bash
   rendercv render John_Doe_CV.yaml
   ```

5. Find your generated PDF in the `/rendercv/rendercv_output/` directory

---

## 📂 FILE STRUCTURE

All your CV files are stored in `${APP_DATA_DIR}/data/`:

```
data/
├── Your_Name_CV.yaml          # Your CV source file
├── rendercv_output/           # Generated PDFs and files
│   ├── Your_Name_CV.pdf      # Final PDF output
│   └── Your_Name_CV.typ      # Generated Typst code
└── themes/                    # Custom themes (optional)
```

---

## 🎨 THEMES

RenderCV comes with several built-in themes:

- **classic** - Traditional academic CV layout
- **engineeringresumes** - Modern engineering resume
- **sb2nov** - Popular single-column design
- **moderncv** - Clean and modern style
- **engineeringclassic** - Classic engineering layout

Specify the theme in your YAML file:
```yaml
design:
  theme: classic
```

---

## 📝 YAML STRUCTURE

Your CV YAML file contains:

- **cv** - Personal information and CV sections
  - name, location, email, website
  - phone, social_networks
  - sections (education, experience, skills, etc.)

- **design** - Appearance customization
  - theme selection
  - colors, fonts, margins
  - page size and formatting

- **locale_catalog** - Multi-language support
  - Custom translations for section headers

---

## 🌍 MULTI-LANGUAGE SUPPORT

RenderCV supports documents in multiple languages including:

- English, French, German, Spanish, Italian
- Portuguese, Dutch, Russian
- Chinese (Simplified & Traditional)
- Japanese, Korean, Arabic
- And many more via Typst's font system

---

## 🔧 ADVANCED USAGE

**Generate with custom output:**
```bash
rendercv render --pdf-path /rendercv/output.pdf John_Doe_CV.yaml
```

**View available commands:**
```bash
rendercv --help
```

**Create from template:**
```bash
rendercv new "Your Name" --theme moderncv
```

---

## 📋 REQUIREMENTS

- The container includes all dependencies pre-installed
- Your YAML files must follow RenderCV schema
- Typst engine handles PDF generation automatically

---

## ⚠️ IMPORTANT

- **No Web Interface** - This is a CLI-only application
- Files in `/rendercv/` persist across container restarts
- Use `docker exec` to access the container and run commands
- Generated PDFs can be accessed from the host system in `${APP_DATA_DIR}/data/rendercv_output/`

---

## 💾 SOURCE

* [rendercv/rendercv](https://github.com/rendercv/rendercv)
* [Documentation](https://docs.rendercv.com/)
* [Examples](https://github.com/rendercv/rendercv/tree/main/examples)

---

## ❤️ PROVIDED WITH LOVE

This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the [official GitHub repository](https://github.com/rendercv/rendercv/issues).
