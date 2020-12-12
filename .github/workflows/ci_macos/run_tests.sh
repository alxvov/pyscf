#!/usr/bin/env bash
export OMP_NUM_THREADS=1 
export PYTHONPATH=$(pwd):$PYTHONPATH 

cd ./pyscf
echo 'pbc_tools_pbc_fft_engine = "NUMPY"' > .pyscf_conf.py
echo "dftd3_DFTD3PATH = './lib/deps/lib'" >> .pyscf_conf.py

nosetests -v --with-timer \
    --exclude-dir=dmrgscf --exclude-dir=fciqmcscf \
    --exclude-dir=icmpspt --exclude-dir=shciscf --exclude-dir=examples --exclude-dir=nao \
    --exclude-dir=cornell_shci --exclude-dir=pbc/grad \
    -e test_bz \
    -e h2o_vdz \
    -e test_mc2step_4o4e \
    -e test_ks_noimport \
    -e test_jk_single_kpt \
    -e test_jk_hermi0 \
    -e test_j_kpts \
    -e test_k_kpts \
    -e high_cost \
    -e skip \
    -e call_in_background \
    -e libxc_cam_beta_bug \
    -e test_finite_diff_rks_eph \
    -e test_finite_diff_uks_eph \
    -I test_kuccsd_supercell_vs_kpts\.py \
    -I test_kccsd_ghf\.py \
    -I test_h_.*\.py \
    -I test_P_uadc_ea.py \
    -I test_P_uadc_ip.py \
    --exclued-test=df/test/test_df_jk.test_dhf \
    --exclude-test=pbc/gw/test/test_kgw_slow_supercell.DiamondTestSupercell3 \
    --exclude-test=pbc/gw/test/test_kgw_slow_supercell.DiamondKSTestSupercell3 \
    --exclude-test=pbc/gw/test/test_kgw_slow.DiamondTestSupercell3 \
    --exclude-test=pbc/gw/test/test_kgw_slow.DiamondKSTestSupercell3 \
    --exclude-test=pbc/tdscf/test/test_krhf_slow_supercell.DiamondTestSupercell3 \
    --exclude-test=pbc/tdscf/test/test_kproxy_hf.DiamondTestSupercell3 \
    --exclude-test=pbc/tdscf/test/test_kproxy_ks.DiamondTestSupercell3 \
    --exclude-test=pbc/tdscf/test/test_kproxy_supercell_hf.DiamondTestSupercell3 \
    --exclude-test=pbc/tdscf/test/test_kproxy_supercell_ks.DiamondTestSupercell3 \
    -I .*_slow.*py -I .*_kproxy_.*py -I test_proxy.py # tdscf/*_slow.py gw/*_slow.py do not compatible with python3.[456] and old numpy