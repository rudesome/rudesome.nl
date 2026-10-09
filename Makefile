.PHONY: all site resume clean

# Anything that influences the generated site or résumé.
SOURCES := config.toml assets/resume.tex \
	$(wildcard data/*.yaml) \
	$(wildcard content/*/*.md) \
	$(wildcard layouts/*.html layouts/*/*.html) \
	$(wildcard assets/sass/*.scss)

all: docs/resume.pdf

site: docs/resume.tex
resume: docs/resume.pdf

# Hugo renders the site into docs/ and publishes the filled-in
# LaTeX template (assets/resume.tex) as docs/resume.tex.
docs/resume.tex: $(SOURCES)
	hugo

docs/resume.pdf: docs/resume.tex resume/awesome-cv.cls
	mkdir -p resume/build
	# Run twice so hyperref page labels/bookmarks are resolved.
	cd resume && xelatex -interaction=nonstopmode -halt-on-error -output-directory ./build ../$<
	cd resume && xelatex -interaction=nonstopmode -halt-on-error -output-directory ./build ../$<
	mv resume/build/resume.pdf $@

clean:
	rm -rf docs resume/build
	mkdir -p docs
	git checkout docs/CNAME docs/.nojekyll
