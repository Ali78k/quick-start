# This file is almost empty on purpose.
#
# Terraform reads every file ending in .tf in this directory and treats them
# together as one single configuration. So main.tf is no entry point, and it
# does not even have to exist.
#
# What belongs here: things shared across resources, not tied to a single one.
# The containers live in containers.tf, later machines in vms.tf.
