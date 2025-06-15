ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=42@sha256:0383a268ad33b3f0302d46c5977022c474453a0420efeb1d3b4dfd055f7f75c0

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN dnf install -y \
    adw-gtk3-theme \
    distrobox \
    gnome-tweaks

COPY --chown=root:root root/etc /etc

RUN systemctl --root=/ enable rpm-ostreed-automatic.timer

RUN ostree container commit
