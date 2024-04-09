runCodeGen:
    dart run build_runner build --delete-conflicting-outputs

genIntl:
    flutter gen-l10n

cleanPods:
    rm -rf Pods && rm Podfile.lock && pod install --repo-update

runTest:
    flutter test test/widget_test.dart

runTestCovD:
    flutter test --coverage && genhtml coverage/lcov.info -o coverage.html && open coverage.html/index.html && sleep 5 && rm -r coverage && rm -r coverage.html
    
runTestCov:
    flutter test --coverage && genhtml coverage/lcov.info -o coverage.html && open coverage.html/index.html
