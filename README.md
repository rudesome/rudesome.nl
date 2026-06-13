# rudesome.nl — résumé website and PDF builder

The source for [rudesome.nl](https://rudesome.nl): a personal résumé site that
also generates a matching PDF. Both the website and the PDF are built from the
same data files in `data/`, so the content only has to be maintained in one place.

## Built with

- Site generator: [Hugo](https://gohugo.io/)
- Theme: [Awesome Identity](https://github.com/posquit0/hugo-awesome-identity)
- PDF/résumé template: [Awesome-CV](https://github.com/posquit0/Awesome-CV)

## Editing the content

All résumé content lives in `data/`:

- `data/experiences.yaml` — work experience
- `data/education.yaml` — education
- `data/certifications.yaml` — certifications
- `data/projects.yaml` — projects

The homepage bio and contact details live in `config.toml`, and the résumé
summary lives in `content/resume/_index.md`.

## Building

The fonts used by the PDF are bundled in `resume/fonts/`.

```sh
make        # build the website and the PDF (output goes to docs/)
make resume # build only the résumé PDF
make clean  # remove generated output
```

A reproducible build environment (Hugo + TeX Live) is available via Nix:

```sh
nix develop
```
