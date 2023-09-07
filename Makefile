test:
	bandit -r scraper/
	flake8 scraper/
	black --check .
	isort --check .

	markdownlint '**/*.md'
	pyflakes scraper

release: test
	python3 setup.py sdist bdist_wheel

upload:
	twine upload --skip-existing dist/*
