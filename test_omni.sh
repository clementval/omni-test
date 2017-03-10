#!/bin/bash 

#
# This scripts helps to test regression in OMNI Compiler before 
# updating the dependency on the CLAW project.
#

function show_help(){
  echo "$0 [-b <branch-name>] [-f] [-c gnu|pgi|cray]"
  echo ""
  echo "Options:"
  echo " -b <branch-name>  Specifiy the branch to be tested"
  echo " -f                Use the forked repository in my personal GitHub for test"
  echo " -m                Use the forked repository in MeteoSwiss-APN for test"
  echo " -c <compiler-id>  Define the base compiler to use"
}

# Define local variable
OMNI_BRANCH="master"
OMNI_MAIN_REPO="git@github.com:omni-compiler/omni-compiler.git"
OMNI_FORK_MCH_REPO="git@github.com:MeteoSwiss-APN/omni-compiler.git"
OMNI_FORK_REPO="igit@github.com:clementval/omni-compiler-1.git"
OMNI__REPO=$OMNI_MAIN_REPO
OMNI_TEST_DIR=test_omni
OMNI_INSTALL_DIR=$PWD/$OMNI_TEST_DIR/install
OMNI_BASE_COMPILER="gnu"

while getopts "hfmb:c:" opt; do
  case "$opt" in
  h)
    show_help
    exit 0
    ;;
  m)  
    OMNI_REPO=$OMNI_FORK_MCH_REPO
    ;;
  f)  
    OMNI_REPO=$OMNI_FORK_REPO
    ;;
  b)  
    OMNI_BRANCH=$OPTARG
    ;;
  c)  
    OMNI_BASE_COMPILER=$OPTARG
    ;;
  esac
done

COMPUTER=$(hostname)


# Load correct PrgEnv
case  "$OMNI_BASE_COMPILER" in
  "gnu")
    OMNI_FC=gfortran
    OMNI_CC=gcc
    OMNI_CXX=g++
  ;;
  "pgi")
    OMNI_FC=mpif90
    OMNI_CC=mpicc
    OMNI_CXX=pgc++
  ;;
  "cray")
    OMNI_FC=ftn
    OMNI_CC=cc
    OMNI_CXX=CC
  ;;
  *)
    echo "Error: Unknown compiler ..."
    exit 1
esac

echo ""
echo "OMNI Compiler FORTRAN Front-End tests"
echo "================================"
echo "- Computer: $COMPUTER"
echo "- Repo: $OMNI_REPO"
echo "- Branch: $OMNI_BRANCH"
echo "- Base compiler: $OMNI_BASE_COMPILER"
echo "- Install path: $OMNI_INSTALL_DIR"
echo "  - FC : $OMNI_FC"
echo "  - CC : $OMNI_CC"
echo "  - CXX: $OMNI_CXX"
echo "- Working dir: $OMNI_TEST_DIR" 
echo "================================"
echo ""



# Prepare directory
rm -rf $OMNI_TEST_DIR
mkdir $OMNI_TEST_DIR
cd $OMNI_TEST_DIR

# Retrive repository and branch
git clone -b $OMNI_BRANCH $OMNI_REPO
cd omni-compiler

# Configuree
FC=$OMNI_FC CC=$OMNI_CC CXX=$OMNI_CXX ./configure

# Compile
make
