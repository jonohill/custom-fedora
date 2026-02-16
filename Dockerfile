ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=44@sha256:483f427ef0d7096577236af6965cd45c58d3b3ee01bcc260ef8f25051092f622

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN dnf install -y \
    adw-gtk3-theme \
    distrobox \
    gnome-tweaks

COPY --chown=root:root root/etc /etc

RUN systemctl --root=/ enable rpm-ostreed-automatic.timer

RUN ostree container commit
