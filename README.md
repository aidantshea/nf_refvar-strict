# nf_refvar-strict

Reference-based variant calling and assembly of non-segmented viral genomes. 

## Description

This project re-imagines the original nf_refvar pipeline (https://github.com/uwvirology-ngs/nf_refvar) used in production at the University of Washington to conform to strict syntax with Nextflow versions v25.04.0+. 

## Requirements

This pipeline is developed and tested on Ubuntu 24.04 LTS with Nextflow version 25.10.4+ and Docker v29.3.1+. Compatibility is expected with these and all more recent releases. 

Install [`Nextflow`](https://www.nextflow.io/docs/latest/install.html)

Install [`Docker`](https://docs.docker.com/engine/install/)

## Run nf_refvar-strict

### Run Test:

```bash
nextflow run main.nf \
    -params-file test_run.json
```

## CLI Options

### Required Parameters
| Parameter | About | Example |
|---------|---------|---------|
| `--samplesheet` | samplesheet CSV | /assets/example_input/samplesheet.csv |
| `--adapter_list` | adapters as FASTA | /assets/adapters/adapters_greninger.fasta |

## Contact

For feature suggestions and bug reports, please file an issue on the project [GitHub](https://github.com/aidantshea/nf_refvar-strict/issues).

For other inquiries, please reach out to aidants@uw.edu. 