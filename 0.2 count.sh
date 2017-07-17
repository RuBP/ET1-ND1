# Exit this script on any error
set -euo pipefail

# The gene feature file
GTF=~/anno/gencode.vM14.annotation.gtf

# Generate read counts
echo "*** Counting features with: $GTF"
featureCounts -a $GTF -g gene_id -o counts.txt bam/*.bam

echo "*** Generating simple counts"
cat counts.txt | cut -f 1,7-26 > simple_counts.txt