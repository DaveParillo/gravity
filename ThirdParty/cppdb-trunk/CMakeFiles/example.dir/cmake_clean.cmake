FILE(REMOVE_RECURSE
  "CMakeFiles/example.dir/examples/example1.cpp.o"
  "example.pdb"
  "example"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/example.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
