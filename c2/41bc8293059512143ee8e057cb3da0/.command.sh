#!/usr/bin/env bash -C -e -u -o pipefail
mkdir -p isofox/

isofox \
    -Xmx103079215104 \
     \
    -sample IPD2051-R03-P01-A08 \
    -functions 'TRANSCRIPT_COUNTS;ALT_SPLICE_JUNCTIONS;FUSIONS;RETAINED_INTRONS' \
    -read_length 93 \
    -bam_file IPD2051-R03-P01-A08.md.bam \
    -ref_genome Homo_sapiens.GRCh37.GATK.illumina.fasta \
    -ref_genome_version 37 \
    -ensembl_data_dir ensembl_data \
    -known_fusion_file known_fusion_data.37.csv \
    -exp_counts_file read_93_exp_counts.37.csv \
    -exp_gc_ratios_file read_93_exp_gc_ratios.37.csv \
    -gene_id_file tso500_rna_gene_ids.csv \
    -panel_tpm_norm_file isofox.gene_normalisation.tso500.37.csv \
    -threads 16 \
    -log_level DEBUG \
    -output_dir isofox/

cat <<-END_VERSIONS > versions.yml
"NFCORE_ONCOANALYSER:TARGETED:ISOFOX_QUANTIFICATION:ISOFOX":
    isofox: $(isofox -version | sed -n '/^Isofox version / { s/^.* //p }')
END_VERSIONS
