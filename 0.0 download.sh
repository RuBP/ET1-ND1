# 2017/07/11 https://www.gencodegenes.org/mouse_releases/current.html
# Git repo created following http://swcarpentry.github.io/git-novice/03-create/

# Download mouse(M14) genome sequence, primary assembly (GRCm38) from Gencode
curl -O ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_mouse/release_M14/GRCm38.primary_assembly.genome.fa.gz
gunzip GRCm38.primary_assembly.genome.fa.gz 

# Build Hisa2 index for mouse genome GRCm38
hisat2-build GRCm38.primary_assembly.genome.fa GRCm38.primary_assembly.genome

# Download comprehensive gene annotation GTF (regions CHR)
curl -O ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_mouse/release_M14/gencode.vM14.annotation.gtf.gz
gunzip gencode.vM14.annotation.gtf.gz
