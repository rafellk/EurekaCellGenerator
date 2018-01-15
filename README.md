# Eureka Cell Generator
This is an easy way for creating the basics of Eureka framework custom cells

### Installation

	$ git clone git@github.com:rafellk/EurekaCellGenerator.git
	$ vim ~/.bashrc
	
	Copy the following line and save it:
	$ export PATH=$PATH:path/to/your/EurekaCellGenerator/

### Usage

	$ eureka_cell_generator.swift TestCell

#### This should output the following lines:
	
	Starting to generate code...
	Generated TestCell.swift
	Generated TestCell.xib

#### If you want to create those files in a specific folder, then run:

	$ eureka_cell_generator.swift TestCell /path/to/folder/
	
#### This should output the following lines:

	Starting to generate code...
	Generated /path/to/folder/TestCell.swift
	Generated /path/to/folder/TestCell.xib
	
### More

This is a tool for creating generic cells for supporting development using the Eureka framework. Take a look at [Eureka Framework](https://github.com/xmartlabs/Eureka).
