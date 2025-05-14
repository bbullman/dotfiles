#!/bin/bash

# Script to remove unused (orphaned) packages from the Arch Wiki
pacnan -Qdtq | pacman  -Rns -
