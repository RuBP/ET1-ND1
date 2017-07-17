# Exit this script on any error.
set -euo pipefail

# This keeps track of the messages printed during execution.
RUNLOG=runlog.txt
echo "Run by `whoami` on `date`" > $RUNLOG

# Create output folder
mkdir -p bam

# The index determines what the data is aligned against.
IDX=~/anno/GRCm38.primary_assembly.genome

for SAMPLE in S14 S14G S14N S27G S27N W
do
	for REP in 1 2 3;
	do
		# Build the name of the files
		R1=reads/${SAMPLE}-${REP}.fastq.gz
		BAM=bam/${SAMPLE}-${REP}.bam

		# Run the aligner
		echo '*** Aligning: $BAM'
		hisat2 $IDX -U $R1 2>> $RUNLOG | samtools sort > $BAM 2>> $RUNLOG
		samtools index $BAM
	done
done

hisat2 $IDX -U reads/S27.fastq.gz 2>> $RUNLOG | samtools sort > bam/S27.bam 2>> $RUNLOG
samtools index bam/S27.bam

hisat2 $IDX -U reads/S27G-4.fastq.gz 2>> $RUNLOG | samtools sort > bam/S27G-4.bam 2>> $RUNLOG
samtools index bam/S27G-4.bam