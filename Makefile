RAW_DATA_PATH = raw_data/WHR2023.csv
PROCESSED_DATA = processed_data/WHR2023_cleaned.csv

install:
	python.exe -m pip install --upgrade pip
	@pip install -r requirements.txt

format:
	@black *.py --line-length 88

process:
	@python data_processing.py $(RAW_DATA_PATH)

analyze:
	@python data_analysis.py $(PROCESSED_DATA)

clean:
	@rm -f processed_data/* **/*.png

all: install format process analyze