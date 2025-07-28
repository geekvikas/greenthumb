import React, { useEffect, useState } from 'react';
import {
  Typography,
  Grid,
  Paper,
  Box,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Chip,
  Divider,
  Stack,
} from '@mui/material';
import dayjs from 'dayjs';
import client from '../api/client';

const tierColors = {
  gold: 'warning',
  silver: 'info',
  bronze: 'default',
};

const CustomerInsights = () => {
  const [summary, setSummary] = useState(null);
  const [topCustomers, setTopCustomers] = useState([]);

  useEffect(() => {
    client.get("/customers/insights").then((res) => {
      setSummary(res.data.summary);
      setTopCustomers(res.data.top_customers);
    });
  }, []);

  return (
    <Box sx={{ mt: 4, width: '100%' }}>
      <Typography variant="h4" gutterBottom>
        Customer Insights
      </Typography>

      {/* Summary Statistics */}
      {summary && (
        <Paper elevation={3} sx={{ p: 3, mb: 4 }}>
          <Typography variant="h6" gutterBottom>
            Summary Statistics
          </Typography>
          <Grid container spacing={2}>
            <Grid item xs={12} md={4}>
              <Typography variant="subtitle1">Customer Tiers</Typography>
              <Stack direction="row" spacing={1}>
                {Object.entries(summary.tier_counts).map(([tier, count]) => (
                  <Chip
                    key={tier}
                    label={`${tier.charAt(0).toUpperCase() + tier.slice(1)}: ${count}`}
                    color={tierColors[tier]}
                    variant="outlined"
                  />
                ))}
              </Stack>
            </Grid>
            <Grid item xs={12} md={4}>
              <Typography variant="subtitle1">Average Order Value</Typography>
              <Typography variant="h6">${parseFloat(summary.avg_order_value).toFixed(2)}</Typography>
            </Grid>
            <Grid item xs={12} md={4}>
              <Typography variant="subtitle1">Retention Rate</Typography>
              <Typography variant="h6">{summary.retention_percent}%</Typography>
            </Grid>
          </Grid>
        </Paper>
      )}

      {/* Top Customers Table */}
      <Paper elevation={3} sx={{ p: 3 }}>
        <Typography variant="h6" gutterBottom>
          Top Customers
        </Typography>
        <Divider sx={{ mb: 2 }} />
        <TableContainer>
          <Table size="small">
            <TableHead>
              <TableRow>
                <TableCell>Name</TableCell>
                <TableCell>Email</TableCell>
                <TableCell>Registered</TableCell>
                <TableCell>Tier</TableCell>
                <TableCell align="right">Orders</TableCell>
                <TableCell align="right">Total Spent</TableCell>
                <TableCell>Last Order</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {topCustomers.map((customer) => (
                <TableRow key={customer.id}>
                  <TableCell>{customer.name}</TableCell>
                  <TableCell>{customer.email}</TableCell>
                  <TableCell>{dayjs(customer.registration_date).format('MMM D, YYYY')}</TableCell>
                  <TableCell>
                    <Chip
                      label={customer.customer_tier}
                      color={tierColors[customer.customer_tier]}
                      size="small"
                    />
                  </TableCell>
                  <TableCell align="right">{customer.order_count}</TableCell>
                  <TableCell align="right">${parseFloat(customer.total_spent).toFixed(2)}</TableCell>
                  <TableCell>{dayjs(customer.last_order_date).format('MMM D, YYYY')}</TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      </Paper>
    </Box>
  );
};

export default CustomerInsights;
