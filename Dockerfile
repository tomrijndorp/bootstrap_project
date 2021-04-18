FROM ubuntu:20.04
ARG DUSER=youser

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  clang-11 \
  curl \
  git \
  gnupg \
  python3 \
  python3-venv \
&& \
  update-alternatives \
    --install /bin/clang clang $(which clang-11) 50 \
    --slave /bin/clang++ clang++ $(which clang++-11)

# Install Bazel
RUN \
  curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg && \
  mv bazel.gpg /etc/apt/trusted.gpg.d/ && \
  echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
  apt-get update && apt-get install -y bazel

COPY . /home/$DUSER/bootstrap_project

RUN \
  useradd $DUSER && \
  chown -R $DUSER:$DUSER /home/$DUSER/

USER $DUSER

# Test
RUN \
  git config --global user.name "Test User" && \
  git config --global user.email "test@user.com" \
  && cat ~/.gitconfig \
  && cd /tmp; mkdir a; cd a; git init; touch x; git add .; git commit -m test

RUN \
  # Python project
  ~/bootstrap_project/make_project --py ~/py_test && \
  # C++ project
  ~/bootstrap_project/make_project --cpp ~/cpp_test && \
  echo Success!
