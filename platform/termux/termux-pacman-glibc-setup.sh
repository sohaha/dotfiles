#!/usr/bin/env -S bash -xeuo pipefail

set -xeuo pipefail

pkg install pacman patchelf \
  which time ldd tree

echo
echo

pacman-key --init

echo
echo

pacman-key --populate

echo
echo

pacman -Syu

echo
echo

pacman -Sy glibc-runner --assume-installed bash,patchelf,resolv-conf

echo
echo

grun --help

echo
echo

curl -fsSL https://deno.land/install.sh | time sh

echo
echo

curl -fsSL https://bun.sh/install | time bash

echo
echo

export DENO_INSTALL="${HOME}/.deno"
export BUN_INSTALL="$HOME/.bun"
export PATH="${PATH}:${DENO_INSTALL}/bin:${BUN_INSTALL}/bin"

echo
echo

patchelf --print-interpreter --print-needed "$(which deno)"

echo
echo

patchelf --print-interpreter --print-needed "$(which bun)"

echo
echo

patchelf --set-rpath "${PREFIX}/glibc/lib" --set-interpreter "${PREFIX}/glibc/lib/ld-linux-aarch64.so.1" "$(which deno)"

patchelf --set-rpath "${PREFIX}/glibc/lib" --set-interpreter "${PREFIX}/glibc/lib/ld-linux-aarch64.so.1" "$(which bun)"

echo
echo

ldd "$(which deno)"

echo
echo

ldd "$(which bun)"

echo
echo

for i in deno bun; do
  cat - <<EOF >~/".${i}/bin/${i}.glibc.sh"
#!/usr/bin/env sh

_oldpwd="\${PWD}"
_dir="\$(dirname "\${0}")"
cd "\${_dir}"

if ! [ -h "${i}" ] ; then
  >&2 mv -fv "${i}" "${i}.orig"
  >&2 ln -sfv "${i}.glibc.sh" "${i}"
fi
cd "\${_oldpwd}"
LD_PRELOAD= exec "\${_dir}/${i}.orig" "\${@}"
# Or
#exec grun "\${_dir}/${i}.orig" "\${@}"

EOF

  chmod -c u+x ~/".${i}/bin/${i}.glibc.sh"
done

echo
echo

deno.glibc.sh --version

echo
echo

bun.glibc.sh --version

echo
echo

tree -a ~/.deno ~/.bun

echo
echo

cat -n ~/.deno/bin/deno.glibc.sh

echo
echo

cat -n ~/.bun/bin/bun.glibc.sh

echo
echo

deno <<<"console.log('Hello world')"

echo
echo

file="$(mktemp -p ~/.cache --suffix .js hello-XXX)"

echo "console.log('Hello world')" >"${file}"

bun run "${file}"

echo
echo
