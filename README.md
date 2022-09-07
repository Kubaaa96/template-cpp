# template-cpp

### Requirements
- Compiler (Gcc / clang / MSVC)
- Cppcheck
- ccatche
- Conan

### Things to add
- [x] Licence update
- [x] Conan support
    - [x] fmt 8.x.x
    - [x] spdlog 1.10.0
    - [x] gtest 1.11.0
- [x] Appropriate compiler flags GCC 
- [x] Appropriate compiler flags Clang
- [x] Appropriate compiler flags MSVC
- [x] Cpp20 support
- [x] clang-tidy
- [x] [cppcheck](https://cppcheck.sourceforge.io/)
- [x] [ccache](https://ccache.dev/)
- [x] [Google test examples](https://google.github.io/googletest/)
- [ ] Think about and add Relase builds in CI/CD
- [ ] Docker development environment example
- [ ] [Doxygen documentation setup](https://www.doxygen.nl/index.html)
- [x] github actions for three compilers (GCC, Clang, MSVC)
  - [x] GCC
  - [x] Clang
  - [x] MSVC
- [ ] github actions for three platforms (Linux, Windows, Mac OS)
- [x] Basic code coverage
- [ ] Advanced code coverage based on unit and integrations tests and combined coverage
- [ ] Badges
    - [ ] Coverage at unit tests
    - [ ] Coverage at integration tests
    - [ ] Combined coverage
    - [ ] code quality c/c++
    - [ ] All compilers and all platforms
- [ ] Docs folder
- [ ] [Fuzz testing with LibFuzzer](https://llvm.org/docs/LibFuzzer.html)
- [ ] Sanitizers
    - [ ] [Address](https://github.com/google/sanitizers/wiki/AddressSanitizer) or [HWASAN](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html)
    - [ ] [Memory](https://github.com/google/sanitizers/wiki/MemorySanitizer)
    - [ ] [Thread](https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual)
    - [ ] [Leak](https://github.com/google/sanitizers/wiki/AddressSanitizerLeakSanitizer)
    - [ ] [Undefined Behaviour](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html)

### Troubleshooting

Invalid setting '14' is not a valid 'settings.compiler.version' value.

If you see above warning. Just update your conan settings like [this](https://docs.conan.io/en/1.36/extending/custom_settings.html#custom-settings)
