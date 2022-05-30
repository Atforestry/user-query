import streamlit as st
from streamlit_folium import st_folium
import folium

st.title('Atforestry (beta)')
st.markdown('Atforestry is a web application for the analysis of forest data and deforestation. It is currently in beta and is not ready for production.')
st.markdown('Select the area in the map to start the analysis.')

m = folium.Map(min_zoom = 6, max_zoom = 6)
m.fit_bounds([[-53,-4],[-52,-3]])
st_data = st_folium(m, width = 725)