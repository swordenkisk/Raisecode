#!/data/data/com.termux/files/usr/bin/bash
# سكريبت إنشاء مشروع جديد بسرعة

CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}📁 Create New Claude Project${NC}"
echo -n "Project name: "
read PROJECT_NAME

PROJECT_DIR=~/storage/shared/ClaudeProjects/$PROJECT_NAME
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Initialize git
git init

# Create basic CLAUDE.md
cat > CLAUDE.md << EOF
# $PROJECT_NAME

## Project Overview
(Describe your project here)

## Tech Stack
- 

## Commands
- 

## Notes
- 
EOF

echo -e "${GREEN}✓ Project '$PROJECT_NAME' created at $PROJECT_DIR${NC}"
echo -e "Starting Claude Code..."
claude .
