# omniORB-cmake

This is a fork from <https://sourceforge.net/p/omniorb/svn/> which allows to build omniORB using CMake.

All the work was done by [Julian Scholle](https://github.com/CaeruleusAqua): <https://github.com/CaeruleusAqua/omniORB-cmake>. Big thanks!
As he doesn't maintain it anymore, I forked the repository and re-organised it using different branches.

- The **main** branch only includes this README.
- The **master** branch comes from the <https://github.com/CaeruleusAqua/omniORB-cmake> repository where initial work was done. It'not used anymore.
- The branch **4_2** is used to keep official releases.
- Modifications for cmake are in the **4_2_cmake** branch.

To add a new release:

- Download and commit the new omniORB release:

  ```
  git checkout 4_2
  git rm -rf *
  tar xfj ../omniORB-4.2.x.tar.bz2
  mv omniORB-4.2.x/* .
  rmdir omniORB-4.2.x
  git add .
  git commit -m "omniORB 4.2.x"
  git tag -a 4.2.x
  ```

- Merge the changes in the **4_2_cmake** branch:

  ```
  git checkout 4_2_cmake
  git merge 4_2
  ```

- Edit the `CMakeLists.txt` file to bump the cmake OmniORB version to 4.2.x. Commit your change.

- Review the changes in the 4.2.x release and check if any change is required in the build system (files to add in the CMakeLists.txt).

- To generate a patch, run:

  ```
  git diff 4.2.x > /tmp/omniorb-4.2.x-cmake.patch
  ```
