# rudesome.nl — résumé website and PDF builder

The source for [rudesome.nl](https://rudesome.nl): a personal résumé site that
also generates a matching PDF. Both the website and the PDF are built from the
same data files in `data/`, so the content only has to be maintained in one place.

## Built with

- Site generator: [Hugo](https://gohugo.io/)
- Theme: [Awesome Identity](https://github.com/posquit0/hugo-awesome-identity) (vendored in `themes/`, overridden in `layouts/`)
- PDF/résumé template: [Awesome-CV](https://github.com/posquit0/Awesome-CV)

## Editing the content

All résumé content lives in `data/`:

- `data/experiences.yaml` — work experience
- `data/education.yaml` — education
- `data/certifications.yaml` — certifications (keep IDs quoted so YAML treats them as strings)
- `data/projects.yaml` — projects (optional; the section is hidden when the file has no entries)

The homepage bio, contact details and meta description live in `config.toml`,
and the résumé summary lives in `content/resume/_index.md`.

## How it works

1. `hugo` renders the site into `docs/` and fills in the LaTeX template
   `assets/resume.tex`, publishing it as `docs/resume.tex`.
2. `xelatex` compiles `docs/resume.tex` with the Awesome-CV class in `resume/`
   into `docs/resume.pdf`. The fonts used by the PDF are bundled in `resume/fonts/`.

## Building

```sh
make        # build the website and the PDF (output goes to docs/)
make site   # build only the website (and docs/resume.tex)
make resume # build the résumé PDF (rebuilds the site first if needed)
make clean  # remove generated output (keeps docs/CNAME and docs/.nojekyll)
```

A reproducible build environment (Hugo + a minimal TeX Live) is available via Nix;
with [direnv](https://direnv.net/) it is loaded automatically through `.envrc`:

```sh
nix develop
```

## Deployment

The site is served by GitHub Pages from the `docs/` folder on `main`.
Run `make`, then commit the updated `docs/` output together with your source changes.
