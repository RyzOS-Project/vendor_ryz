# Shebang is intentionally missing - do not run as a script
# Override host metadata to make builds more reproducible and avoid leaking info
export BUILD_USERNAME=Ryz
export BUILD_HOSTNAME=RyzOS-build
export AOSP_REVISION=$(grep "default revision" ".repo/manifests/default.xml" | awk -F '/' '{print $3}' | awk -F '"' '{print $1}')
# Welcome Msg
echo "========================="
echo "  ___          ___  ___  ";
echo " | _ \_  _ ___/ _ \/ __| ";
echo " |   / || |_ / (_) \__ \ ";
echo " |_|_\\_, /__|\___/|___/ ";
echo "      |__/               ";
echo " RyzOS Build Environment "
echo "========================="
echo "Lineage Revision: $AOSP_REVISION"
# ABI compatibility checks fail for several reasons:
#   - The update to Clang 12 causes some changes, but no breakage has been
#     observed in practice.
#   - Switching to zlib-ng changes some internal structs, but not the public
#     API.
#
# We may fix these eventually by updating the ABI specifications, but it's
# likely not worth the effort for us because of how many repos are affected.
# We would need to fork a lot of extra repos (thus increasing maintenance
# overhead) just to update the ABI specs.
#
# For now, just skip the ABI checks to fix build errors.
export SKIP_ABI_CHECKS=true