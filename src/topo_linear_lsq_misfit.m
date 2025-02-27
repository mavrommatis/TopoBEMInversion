function log_wrss_comb=topo_linear_lsq_misfit(K, e_chan, e_outlets, ...
    sig_elev, ind_chan_misfit, G_chan, Ginv_elev, bay_constr, ...
    w_bay_constr, G_bay, lp_constr, w_lp_constr, G_lp, geo_map)

d = [e_chan;e_outlets;bay_constr;lp_constr];

[~, dpred, W] = topo_linear_lsq_soln(d, K, sig_elev, ind_chan_misfit, ...
    G_chan, Ginv_elev, w_bay_constr, G_bay, w_lp_constr, G_lp, geo_map);

log_wrss_comb=log10(sum(W*(d-dpred).^2));
